const mongoose = require('mongoose');

const productSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },
    description: {
        required: true,
        type: String,
        trim: true,
    },
    quantity: {
        required: true,
        type: Number,
    },
    price: {
        required: true,
        type: Number,
    },
    images:[
        {
            type: String,
            required: true,
        }
    ],
    category: {
        required: true,
        type: String,
    },
});

const Product = mongoose.model('Product', productSchema);
module.exports = Product;
