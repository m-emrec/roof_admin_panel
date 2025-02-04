
const { db } = require('../firebase_utils');
const { Firestore, DOCUMENT } = require('../constants');


/// This function is used to create user data on firestore

const createUserDataOnFireStore = async (userRecord) => {
    const { uid, phoneNumber, gender , name , role , memberNumber , membershipStartDate,membershipEndDate,members,mentorId} = userRecord;
    await db.collection(Firestore.collection.USERS).doc(uid).set({
        [DOCUMENT.user.uid]: uid,
        [DOCUMENT.user.phoneNumber]: phoneNumber,
        [DOCUMENT.user.role]: role,
        [DOCUMENT.user.gender]: gender,
        [DOCUMENT.user.name]: name,
        [DOCUMENT.user.memberNumber]: memberNumber,
        [DOCUMENT.user.membershipStartDate]: new Date( membershipStartDate),
        [DOCUMENT.user.membershipEndDate]:new Date(membershipEndDate),
        [DOCUMENT.user.members]: members,
        [DOCUMENT.user.mentorId]: mentorId,
    });
}
module.exports = { createUserDataOnFireStore };