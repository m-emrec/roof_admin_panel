


const { auth, db } = require('../firebase_utils');

const functions = require('firebase-functions');
const { createUserDataOnFireStore } = require('../firestore/createUserDataOnFirestore');
const {Firestore, ERROR_CODES,DOCUMENT} =require('../constants');
const createUserWithPhoneNumber = functions.region("europe-west1").https.onCall(async (data, context) => { 

const {phoneNumber, gender , name , role , memberNumber , membershipStartDate,membershipEndDate,members,mentorId} = data;
    if (!phoneNumber) {
        throw new functions.https.HttpsError(ERROR_CODES.PHONE_NUMBER_REQUIRED );
    }
    try {
   
   const userRecord = await auth.createUser({ phoneNumber });
   
  
    await createUserDataOnFireStore(
        {
            uid: userRecord.uid,
            phoneNumber: phoneNumber,
            gender: gender,
            name: name,
            role: role,
            memberNumber: memberNumber,
            membershipStartDate: membershipStartDate,
            membershipEndDate: membershipEndDate,
            members: members,
            mentorId: mentorId,
        }
    );
    
    return { success: true , uid: userRecord.uid};
} catch (error) {
    return { success: false , error: error};
   
}
    

});


module.exports = { createUserWithPhoneNumber };