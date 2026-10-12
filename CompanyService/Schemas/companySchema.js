const { z } = require('zod');


const createCompanySchema = z.object({
  name: z
    .string({ required_error: 'name is required' }) 
    .trim()
    .min(1, 'name cannot be blank')
    .max(255, 'name must be at most 255 characters'),
  address: z
    .string({ required_error: 'address_line is required' })
    .trim()
    .min(1, 'address_line cannot be blank')
    .max(255, 'address_line must be at most 255 characters'),
});


const companyIdParamsSchema = z.object({
  id: z.coerce.number().int('ID must be a whole number').positive('ID must be a positive number')
});

module.exports = { createCompanySchema, companyIdParamsSchema };
