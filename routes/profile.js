const router = require('express').Router()
const ctrl = require('../controllers');

router.get('/browse', ctrl.profile.getAllProfiles);

router.get('/', ctrl.profile.getOwnProfile);

router.get('/:id', ctrl.profile.viewProfile);

router.post('/edit/:id', ctrl.profile.createProfile);

router.put('/', ctrl.profile.editProfile);

router.delete('/', ctrl.profile.deleteProfile);

//this is what the user sees & how the backend knows what to send where
module.exports = router
