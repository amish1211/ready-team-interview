const { z } = require('zod');


const validateRequest = (schemas) => {
  return (req, res, next) => {
    try {
      if (schemas.body) {
        req.body = schemas.body.parse(req.body);
      }
      
      if (schemas.query) {
        req.query = schemas.query.parse(req.query);
      }

      if (schemas.params) {
        req.params = schemas.params.parse(req.params);
      }

      return next();
    } catch (error) {
      if (error instanceof z.ZodError) {
        const formattedErrors = error.issues.reduce((acc, issue) => {
          const fieldName = issue.path.join('.');
          acc[fieldName] = issue.message;
          return acc;
        }, {});

        return res.status(400).json({
          success: false,
          message: 'Input validation failed',
          errors: formattedErrors,
        });
      }
      
      return next(error);
    }
  };
};

module.exports = { validateRequest };