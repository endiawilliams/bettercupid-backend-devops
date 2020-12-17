const request = require('supertest')
const app = require('../../app')
const { sequelize } = require('../../models')

describe('tests the register functionality', () => {
    it('should be able to accept form data', async () => {
        const response = await request(app).post('/api/v1/auth/register')
        expect(response.statusCode).toBe(200)
    })

    afterAll((done) => {
        sequelize.close()
        done()
    })
})