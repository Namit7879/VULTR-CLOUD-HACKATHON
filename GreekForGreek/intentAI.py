# A dictionary containing AI tools and their purposes
ai_tools = {
    'iLovePDF': 'Compressing PDFs, merging, splitting, and converting PDFs',
    'Canva': 'Creating designs, presentations, social media graphics',
    'Grammarly': 'Checking grammar and writing suggestions',
    'Remove.bg': 'Removing backgrounds from images automatically',
    'DALL-E': 'Generating images based on text input',
    'ChatGPT': 'Generating text-based answers, conversations, and more',
    'Hemingway': 'Improving readability and simplifying writing',
    'Lumen5': 'Creating video content from text articles',
    'QuillBot': 'Paraphrasing text and summarizing articles',
    'DeepL': 'Translating text between multiple languages with high accuracy'
}

# Function to recommend an AI tool based on user input
def recommend_tool(user_input):
    recommendations = []
    for tool, purpose in ai_tools.items():
        if user_input.lower() in purpose.lower():
            recommendations.append(tool)
    
    if recommendations:
        print("Based on your input, we recommend the following AI tools:")
        for tool in recommendations:
            print(f"- {tool}")
    else:
        print("Sorry, no tools found for the given input. Please try a different keyword.")

# Example usage
user_input = input("What do you need help with? (e.g., compressing PDFs, designing, translating): ")
recommend_tool(user_input)