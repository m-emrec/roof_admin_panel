const { user } = require("firebase-functions/v1/auth");

module.exports = {
    Firestore: {
        collection: {
            USERS: "users",
            GUESTS: "guests",
            FEEDBACKS : "feedbacks",
        }
    },
    DOCUMENT: {
      user: {
        uid: "uid",
        name: "name",
        about: "about",
        birthDate: "birthDate",
        gender: "gender",
        livingCity: "livingCity",
        workCity: "workCity",
        occupation: "occupation",
        interests: "interests",
        hobbies: "hobbies",
        imageUrl:   "imageUrl",
        membershipStartDate: "membershipStartDate",
        membershipEndDate: "membershipEndDate",
        mentorId: "mentorId",
        members: "members",
        role: "role",
        mentatId: "mentatId",
        phoneNumber: "phoneNumber",
        mentors: "mentors",
        memberNumber: "memberNumber",
    

      },  
    },
    ROLES: {
        GUEST: "guest",
        APPROVED_GUEST: "approvedGuest",
        MEMBER: "member",
        ADMIN: "admin",
    },
    ERROR_CODES: {
        PHONE_NUMBER_REQUIRED: "phone-number-required",
        USER_ALREADY_EXISTS: "user-already-exists",
        USER_NOT_FOUND: "user-not-found",
    }

}

