const router = require('express').Router()
const ctrl = require('../controllers');

router.get('/browse', ctrl.profile.getAllProfiles);

router.get('/', ctrl.profile.getOwnProfile);

router.get('/:id', ctrl.profile.viewProfile);

router.post('/edit', ctrl.profile.createProfile);

router.put('/edit', ctrl.profile.editProfile);

router.delete('/:id', ctrl.profile.removeProfile);

module.exports = router
