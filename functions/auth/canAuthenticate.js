

const { Firestore, ROLES, DOCUMENT } = require('../constants');
const { auth, db } = require('../firebase_utils');

const functions = require('firebase-functions');

const canUserAuthenticate = functions.region("europe-west1").https.onCall(async (data, context) => {
    const {phoneNumber} = data; // Kullanıcının telefon numarası
console.log(phoneNumber);
    if (!phoneNumber) {
        throw new functions.https.HttpsError("invalid-argument", "Telefon numarası gereklidir.");
    }

   

    try {     
            const userRecord = await auth.getUserByPhoneNumber(phoneNumber);
            if (userRecord) {
                return { success: true, };
            }
    } catch (_) {
        try {
            const guestRef = db.collection(Firestore.collection.GUESTS);
            const snapshot = await guestRef.where(DOCUMENT.user.phoneNumber, "==", phoneNumber).
                where(DOCUMENT.user.role, "array-contains", ROLES.APPROVED_GUEST).limit(1).get();
            if (!snapshot.empty) {
                return { success: true, };
            }
        } catch (error) {
            console.log("error",error);
            return { success: false, error: error };
        }
        }
    
});

module.exports = {  canUserAuthenticate };