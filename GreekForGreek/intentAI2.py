import spacy
from collections import defaultdict
from difflib import get_close_matches

# Load pre-trained language model for NLP (spaCy, transformers, etc.)
nlp = spacy.load('en_core_web_sm')

# Define tools with keywords, purposes, and weights
ai_tools = {
    'iLovePDF': {
        'purpose': 'Compressing PDFs, merging, splitting, and converting PDFs',
        'keywords': ['pdf compression', 'pdf merging', 'split pdf', 'convert pdf'],
        'weight': 3  # Higher weight for PDF manipulation
    },
    'Canva': {
        'purpose': 'Creating designs, presentations, social media graphics',
        'keywords': ['design', 'presentation', 'social media graphics'],
        'weight': 4  # Higher weight for designing
    },
    'Grammarly': {
        'purpose': 'Checking grammar and writing suggestions',
        'keywords': ['grammar check', 'writing improvement', 'spelling'],
        'weight': 5  # High relevance to writing tools
    },
    'Remove.bg': {
        'purpose': 'Removing backgrounds from images automatically',
        'keywords': ['background removal', 'image editing'],
        'weight': 3
    },
    'DALL-E': {
        'purpose': 'Generating images based on text input',
        'keywords': ['image generation', 'text to image'],
        'weight': 4
    },
    'ChatGPT': {
        'purpose': 'Generating text-based answers, conversations, and more',
        'keywords': ['text generation', 'conversation', 'chatbot'],
        'weight': 5
    },
    'Hemingway': {
        'purpose': 'Improving readability and simplifying writing',
        'keywords': ['simplify writing', 'readability improvement'],
        'weight': 4
    },
    'Lumen5': {
        'purpose': 'Creating video content from text articles',
        'keywords': ['video creation', 'convert article to video'],
        'weight': 4
    },
    'QuillBot': {
        'purpose': 'Paraphrasing text and summarizing articles',
        'keywords': ['paraphrasing', 'summarizing articles', 'text rewriting'],
        'weight': 5
    },
    'DeepL': {
        'purpose': 'Translating text between multiple languages with high accuracy',
        'keywords': ['language translation', 'text translation'],
        'weight': 5
    }
}

# Synonym dictionary for better matching
synonyms = {
    'edit': ['modify', 'change', 'adjust'],
    'design': ['create', 'make', 'build'],
    'translate': ['convert', 'language'],
    'summarize': ['abstract', 'condense', 'simplify']
}

# Function to find synonyms for input words
def expand_with_synonyms(user_input):
    expanded_input = user_input.split()
    for word in user_input.split():
        if word.lower() in synonyms:
            expanded_input.extend(synonyms[word.lower()])
    return ' '.join(expanded_input)

# Recommendation function using NLP and weighted matching
def recommend_tool(user_input):
    # Step 1: Expand input with synonyms
    expanded_input = expand_with_synonyms(user_input)
    
    # Step 2: Tokenize and process the input using NLP
    user_doc = nlp(expanded_input)

    # Step 3: Initialize scoring for each tool
    scores = defaultdict(int)

    # Step 4: Iterate through AI tools and compare user input with tool purposes/keywords
    for tool, data in ai_tools.items():
        tool_keywords = data['keywords']
        tool_weight = data['weight']

        # Score matching based on keyword overlap and NLP similarity
        for keyword in tool_keywords:
            keyword_doc = nlp(keyword)
            similarity = user_doc.similarity(keyword_doc)  # NLP-based semantic similarity
            if similarity > 0.6:  # Adjust threshold based on required accuracy
                scores[tool] += tool_weight * similarity

    # Step 5: Sort the recommendations by score
    recommendations = sorted(scores.items(), key=lambda x: x[1], reverse=True)

    # Step 6: Provide feedback to the user
    if recommendations:
        print("Based on your input, we recommend the following AI tools:")
        for tool, score in recommendations:
            if score > 0:
                print(f"- {tool} (relevance score: {score:.2f}): {ai_tools[tool]['purpose']}")
    else:
        print("No tools found for the given input. Please try a different keyword or phrase.")

# Example usage
user_input = input("What do you need help with? (e.g., compressing PDFs, designing, translating): ")
recommend_tool(user_input)
