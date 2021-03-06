const request = require('supertest')
const app = require('../../app')
const { sequelize } = require('../../models')

describe('tests the browse path', () => {
    it('should respond to GET request', async () => {
        const response = await request(app).get('/api/v1/profile/browse')
        expect(response.statusCode).toBe(200)
    })

    afterAll((done) => {
        sequelize.close()
        done()
    })
})