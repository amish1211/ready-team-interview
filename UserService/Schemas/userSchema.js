const { z } = require('zod');

const createUserSchema = {
  body: z.object({
    name: z.string().min(3, 'Username must be at least 3 characters'),
    email: z.string().email('Invalid email address'),
    company_id: z.coerce.number().int('ID must be a whole number').positive('ID must be a positive number')
  })
};


const getUserSchema = {
  params: z.object({
    id: z.coerce.number().int('ID must be a whole number').positive('ID must be a positive number')
  })
};


module.exports = { createUserSchema, getUserSchema };