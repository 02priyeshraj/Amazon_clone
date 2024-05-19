const mongoose = require('mongoose');
const { productSchema } = require('./product');

const orderSchema = mongoose.Schema({
    products:[
        {
            product: productSchema,
            quantity: {
                type: Number,
                required: true,
            }
        }
    ],
    totalPrice: {
        required: true,
        type: Number,
    },
    address: {
        required: true,
        type: String,
    },
    userId: {
        required: true,
        type: String,
    },
    orderedAt: {
        required: true,
        type: Number,
    },
    status: {
        type: Number,
        default: 0

    },
});

const Order = mongoose.model('Order', orderSchema);
module.exports = Order;
