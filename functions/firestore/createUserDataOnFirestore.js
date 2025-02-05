
const { db } = require('../firebase_utils');
const { Firestore, DOCUMENT } = require('../constants');


/// This function is used to create user data on firestore

const createUserDataOnFireStore = async (userRecord) => {
    const {  uid,
        name,
        about,
        birthDate,
        gender,
        livingCity,
        workCity,
        occupation,
        interests,
        hobbies,
        imageUrl,
        membershipStartDate,
        membershipEndDate,
        mentorId,
        members,
        role,
        mentatId,
        phoneNumber,
        mentors,
        memberNumber,} = userRecord;
    await db.collection(Firestore.collection.USERS).doc(uid).set({
        [DOCUMENT.user.uid]: uid ?? null,
        [DOCUMENT.user.phoneNumber]: phoneNumber ?? null,
        [DOCUMENT.user.role]: role ?? null,
        [DOCUMENT.user.gender]: gender ?? null,
        [DOCUMENT.user.name]: name ?? null,
        [DOCUMENT.user.memberNumber]: memberNumber ?? null,
        [DOCUMENT.user.membershipStartDate]: membershipStartDate != null ?  new Date( membershipStartDate) : null,
        [DOCUMENT.user.membershipEndDate]:  membershipEndDate !=  null ?  new Date(membershipEndDate) : null,
        [DOCUMENT.user.members]: members ?? null,
        [DOCUMENT.user.mentorId]: mentorId ?? null,
        [DOCUMENT.user.mentatId]: mentatId ?? null,
        [DOCUMENT.user.occupation]: occupation ?? null,
        [DOCUMENT.user.livingCity]: livingCity ?? null,
        [DOCUMENT.user.workCity]: workCity ?? null,
        [DOCUMENT.user.interests]: interests ?? null,
        [DOCUMENT.user.hobbies]: hobbies ?? null,
        [DOCUMENT.user.imageUrl]: imageUrl ?? null,
        [DOCUMENT.user.about]: about    ?? null,
        [DOCUMENT.user.birthDate]: birthDate != null ?  new Date(birthDate) : null,
        [DOCUMENT.user.mentors]: mentors ?? null,
    });
}
module.exports = { createUserDataOnFireStore };