document.getElementById('searchForm').addEventListener('submit', async (event) => {
    event.preventDefault();
    const userInput = document.querySelector('input[name="search"]').value;

    try {
        const container = document.getElementById('recommendationsContainer');
        container.innerHTML = '<p>Loading recommendations...</p>';

        const response = await fetch('http://127.0.0.1:8000/recommend_tool', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ user_input: userInput })
        });

        if (!response.ok) throw new Error('Failed to fetch recommendations');

        const data = await response.json();
        displayRecommendations(data);
    } catch (error) {
        console.error('Error:', error);
        document.getElementById('recommendationsContainer').innerHTML = '<p>Error fetching recommendations. Please try again later.</p>';
    }
});

function displayRecommendations(recommendations) {
    const container = document.getElementById('recommendationsContainer');
    container.innerHTML = ''; // Clear previous results

    if (Array.isArray(recommendations)) {
        recommendations.forEach(tool => {
            const div = document.createElement('div');
            div.className = 'recommendation';
            div.innerHTML = `<strong>${tool.name}</strong><p>${tool.description}</p><a href="${tool.url}" target="_blank">Learn more</a>`;
            container.appendChild(div);
        });
    } else {
        container.innerHTML = '<p>No recommendations found.</p>';
    }
}

// Login and Signup Form Handling
document.addEventListener("DOMContentLoaded", () => {
    const loginForm = document.getElementById("login-form");
    const signupForm = document.getElementById("signup-form");

    // Login Form Submission
    loginForm?.addEventListener("submit", async (event) => {
        event.preventDefault();
        const email = document.getElementById("login-email").value;
        const password = document.getElementById("login-password").value;

        try {
            const response = await fetch("/api/login", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ email, password })
            });
            const result = await response.json();

            if (response.ok) {
                alert("Login successful!");
                window.location.href = "/dashboard.html";
            } else {
                alert("Login failed: " + result.message);
            }
        } catch (error) {
            console.error("Error:", error);
            alert("An error occurred. Please try again.");
        }
    });

    // Signup Form Submission
    signupForm?.addEventListener("submit", async (event) => {
        event.preventDefault();
        const email = document.getElementById("signup-email").value;
        const password = document.getElementById("signup-password").value;
        const name = document.getElementById("signup-name").value;

        try {
            const response = await fetch("/api/signup", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ email, password, name })
            });
            const result = await response.json();

            if (response.ok) {
                alert("Signup successful! You can now log in.");
                window.location.href = "/login.html";
            } else {
                alert("Signup failed: " + result.message);
            }
        } catch (error) {
            console.error("Error:", error);
            alert("An error occurred. Please try again.");
        }
    });
});

// Update Greeting
async function updateGreeting() {
    try {
        const response = await fetch('/api/getUserName');
        const data = await response.json();
        const userName = data.userName || "Friend";
        document.querySelector('.NameContainer .name').innerHTML = `Hello! ${userName}. What are you doing today?`;
    } catch (error) {
        console.error('Error fetching user data:', error);
        document.querySelector('.NameContainer .name').innerHTML = "Hello! Friend. What are you doing today?";
    }
}

// Call updateGreeting after page loads
document.addEventListener("DOMContentLoaded", updateGreeting);

// Load AI Data
async function loadAIData() {
    try {
        const recentlyUsedResponse = await fetch('http://127.0.0.1:8000/api/recently_used');
        const recentlyUsedData = await recentlyUsedResponse.json();
        populateContainer('recentlyUsedContainer', recentlyUsedData);

        const trendingResponse = await fetch('http://127.0.0.1:8000/api/trending');
        const trendingData = await trendingResponse.json();
        populateContainer('trendingContainer', trendingData);

        const randomToolsResponse = await fetch('http://127.0.0.1:8000/api/random_tools');
        const randomToolsData = await randomToolsResponse.json();
        populateContainer('writingToolsContainer', randomToolsData.slice(0, 3));
        populateContainer('exploreContainer', randomToolsData.slice(3, 6));
    } catch (error) {
        console.error("Error fetching AI tool data:", error);
    }
}

function populateContainer(containerId, toolsData) {
    const container = document.getElementById(containerId);
    container.innerHTML = '';

    toolsData.forEach(tool => {
        const div = document.createElement('div');
        div.className = 'tool';
        div.innerHTML = `<strong>${tool.name}</strong><p>${tool.description}</p><a href="${tool.url}">Learn more</a>`;
        container.appendChild(div);
    });
}

// Load AI data when page loads
window.addEventListener('DOMContentLoaded', loadAIData);
