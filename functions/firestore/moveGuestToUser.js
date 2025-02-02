const { admin, db } = require("../firebase_utils")

const functions = require("firebase-functions");
const { Firestore, ROLES, DOCUMENT } = require('../constants');
const { createUserServerSide } = require("../auth/createUserServerSide");

const moveGuestToUser =  functions.region("europe-west1").firestore
        .document("guests/{guestId}")
    // Guests koleksiyonundaki her değişikliği dinler
        .onUpdate(async (change, context) => {
            try {
            const before = change.before.data(); //Güncellemeden önceki veri
            const after = change.after.data();   //Güncellemeden sonraki veri
            
                const roleBefore = [before.role].flat();
                const roleAfter = [after.role].flat();
              console.log(roleBefore);
            //Eğer role alanı guest'ten member'a geçtiyse işlemi yap
                if ((roleBefore.includes(ROLES.GUEST) || roleBefore.includes(ROLES.APPROVED_GUEST)) && roleAfter.includes(ROLES.MEMBER)) {
                    const guestId = context.params.guestId; // Güncellenen belgenin ID'si
                    const userData = change.after.data(); // Kullanıcının güncellenmiş verisi
                   
                    console.log(`🔄 Kullanıcı ${guestId} Users koleksiyonuna taşınıyor...`);
                    
                    await createUserServerSide(
                          userData
                    );
                    // 2️⃣ Guests koleksiyonundan sil (isteğe bağlı)
                    await admin.firestore().collection(Firestore.collection.GUESTS).doc(guestId).delete();

                    console.log(`✅ Kullanıcı ${guestId} başarıyla Users koleksiyonuna taşındı.`);
                }
            } catch (error) {
        console.error("❌ Kullanıcı taşıma sırasında hata oluştu:", error);
      }
    
        });

module.exports = { moveGuestToUser };

/*
moveGuestToUser({
  before: { role: ["guest"], phoneNumber: "+905551234567" }, 
  after: { role: ["member"], phoneNumber: "+905551234567", }
}, { params: { guestId: "89dcb574-042c-50a9-9fb3-23d17c712b55"
 } })

*/