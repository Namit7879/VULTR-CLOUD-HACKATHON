const express = require('express');
const Tool = require('../models/Tool');
const router = express.Router();

// Fetch Tool Recommendations
router.post('/recommend_tool', async (req, res) => {
    const { user_input } = req.body;
    try {
        const recommendations = await Tool.find({ name: new RegExp(user_input, 'i') });
        res.json(recommendations);
    } catch (error) {
        res.status(500).json({ message: "Failed to fetch recommendations" });
    }
});

// Fetch AI Tool Data
router.get('/recently_used', async (req, res) => {
    const tools = await Tool.find({ type: 'recently_used' });
    res.json(tools);
});

router.get('/trending', async (req, res) => {
    const tools = await Tool.find({ type: 'trending' });
    res.json(tools);
});

router.get('/random_tools', async (req, res) => {
    const tools = await Tool.aggregate([{ $sample: { size: 6 } }]);
    res.json(tools);
});

module.exports = router;
