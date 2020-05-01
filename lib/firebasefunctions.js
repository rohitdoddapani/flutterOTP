
const functions = require('firebase-functions');
const admin = require('firebase-admin');

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });
admin.initializeApp();

const fcm = admin.messaging();

exports.loadRule = functions.https.onRequest((req,res) => {
    if(req.method !== "POST"){
        return res.send(500).json({
            message: "Not allowed"
        });
    }
    let data = req.body;
    admin.firestore().collection('devices').doc('div121').set({
        data
    })
    .then(() => {
        return res.status(200).json({
            message: "its stored"
        });
    })
    .catch(err => {
        return res.send(500).json({
            error: err
        });
    });
});

// exports.sendToTopic = functions.firestore
//     .document('devices/div121')
//     .onCreate(async snapshot => {

//         const payload = {
//             notification: {
//                 title: 'Data updated',
//                 body: 'check the water quality',
//                 click_action: 'FLUTTER_NOTIFICATION_CLICK' // required only for onResume or onLaunch callbacks
//             }
//         };

//         return fcm.sendToTopic('div121',payload);
//     });



exports.sendNotification = functions.firestore
    .document('devices/{uid}')
    .onWrite(async snapshot => {
        const did = JSON.stringify(snapshot.after.ref._path.segments);
        var x = JSON.parse(did)[1];
        console.log("ref:",x);
        //const topic = snapshot.after.get('topic');
        var payload = {
            notification: {
                title: 'title',
                body: 'check the water quality',
            },
            data: {
                x
            },
            topic: x,
        };

        let response = await fcm.send(payload);
        console.log(response);
    });