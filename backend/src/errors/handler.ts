import { ErrorRequestHandler } from 'express';
import {ValidationError} from 'yup';


interface ValidationError {
    [key: string]: string[];
}

const errorHandler: ErrorRequestHandler = (error, request, response, next) => {
    // console.log(error);
    if(error instanceof ValidationError) {
        let errors: ValidationError = {};

        error.inner.forEach(err => {
            errors[err.path] = err.errors;
        });

        return response.status(400).json({message: 'Validations fails', errors});
        
    }
    
    return response.status(500).json({message: 'Internal server error'});
};

export default errorHandler;