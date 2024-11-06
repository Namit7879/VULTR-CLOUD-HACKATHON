-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: ai_recommendation_database
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ai_tools`
--

DROP TABLE IF EXISTS `ai_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_tools` (
  `tool_id` int NOT NULL AUTO_INCREMENT,
  `tool_name` varchar(255) NOT NULL,
  `tool_description` text,
  `tool_category` varchar(255) NOT NULL,
  `tool_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tool_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_tools`
--

LOCK TABLES `ai_tools` WRITE;
/*!40000 ALTER TABLE `ai_tools` DISABLE KEYS */;
INSERT INTO `ai_tools` VALUES (1,'Grammarly','A tool for grammar and spell checking','Text Editing','https://www.grammarly.com'),(2,'Canva','A design tool for creating graphics and presentations','Design','https://www.canva.com'),(3,'ChatGPT','A conversational AI tool for text generation','AI Text Generator','https://openai.com/chatgpt'),(4,'TensorFlow','An open-source platform for machine learning','Machine Learning','https://www.tensorflow.org'),(5,'HuggingFace','A platform for NLP models and datasets','Natural Language Processing','https://huggingface.co'),(6,'MidJourney','AI tool for generating art and images','Image Generation','https://www.midjourney.com'),(7,'DALL-E','An AI model for generating images from text','AI Image Generator','https://openai.com/dall-e'),(8,'OpenCV','A library for computer vision and image processing','Computer Vision','https://opencv.org'),(9,'Keras','A high-level neural network API for fast experimentation','Deep Learning','https://keras.io'),(10,'PyTorch','A machine learning library for deep learning','Machine Learning','https://pytorch.org'),(11,'Jupyter','An open-source tool for interactive computing','Data Science','https://jupyter.org'),(12,'Scikit-learn','A tool for machine learning in Python','Machine Learning','https://scikit-learn.org'),(13,'AWS SageMaker','A fully managed service for building machine learning models','Cloud AI Platform','https://aws.amazon.com/sagemaker'),(14,'Google Cloud AI','AI and machine learning tools from Google Cloud','Cloud AI Platform','https://cloud.google.com/products/ai'),(15,'IBM Watson','A suite of enterprise-ready AI tools','AI Cloud Platform','https://www.ibm.com/watson'),(16,'Microsoft Azure AI','Cloud-based AI services from Microsoft','Cloud AI Platform','https://azure.microsoft.com/en-us/services/cognitive-services'),(17,'BigML','A platform for machine learning and predictive modeling','Machine Learning','https://bigml.com'),(18,'Rasa','An open-source conversational AI framework','NLP/Conversational AI','https://rasa.com'),(19,'Dialogflow','A Google-powered platform for building chatbots and voice apps','NLP/Conversational AI','https://dialogflow.cloud.google.com'),(20,'Caffe','A deep learning framework with focus on speed','Deep Learning','https://caffe.berkeleyvision.org'),(21,'Cognitive Toolkit','Microsoft Cognitive Toolkit for deep learning','Deep Learning','https://docs.microsoft.com/en-us/cognitive-toolkit'),(22,'SpaCy','A fast NLP library in Python','Natural Language Processing','https://spacy.io'),(23,'Transformer','An AI architecture for sequence prediction tasks','AI Model','https://huggingface.co/transformers'),(24,'DeepDream','A computer vision program for image generation','Image Generation','https://deepdreamgenerator.com'),(25,'AutoML','A Google tool for automating machine learning','Automated ML','https://cloud.google.com/automl'),(26,'MLFlow','An open-source platform for managing the ML lifecycle','Machine Learning','https://mlflow.org'),(27,'H2O.ai','A platform for AI-driven machine learning','Machine Learning','https://h2o.ai'),(28,'RapidMiner','An advanced analytics platform for machine learning','Data Science','https://rapidminer.com'),(29,'KNIME','An open-source data analytics, reporting, and integration tool','Data Science','https://www.knime.com'),(30,'DataRobot','An enterprise AI platform for automated machine learning','Automated ML','https://www.datarobot.com'),(31,'Clarifai','AI for visual recognition and machine learning','Computer Vision','https://clarifai.com'),(32,'Neurala','An AI tool for visual inspection and anomaly detection','Computer Vision','https://www.neurala.com'),(33,'DeepL','An AI-powered translation tool','Natural Language Processing','https://www.deepl.com'),(34,'Google Translate','AI-powered translation tool from Google','Natural Language Processing','https://translate.google.com'),(35,'Wit.ai','An NLP tool for building conversational interfaces','NLP/Conversational AI','https://wit.ai'),(36,'MonkeyLearn','AI for text analysis and machine learning','Text Analysis','https://monkeylearn.com'),(37,'Aylien','AI for text analysis and NLP','Text Analysis','https://aylien.com'),(38,'SAS Viya','A cloud-native AI and analytics platform','Analytics/AI','https://www.sas.com/viya'),(39,'Dataiku','An AI and machine learning platform for enterprises','Data Science','https://www.dataiku.com'),(40,'Snowflake','A cloud data platform with AI capabilities','Cloud AI Platform','https://www.snowflake.com'),(41,'Seldon','An open-source platform for deploying machine learning models','Machine Learning','https://www.seldon.io'),(42,'Kubeflow','A platform for machine learning on Kubernetes','Machine Learning','https://kubeflow.org'),(43,'DeepMind','AI research and applications by DeepMind','AI Research','https://deepmind.com'),(44,'BERT','A transformer-based AI model for NLP tasks','Natural Language Processing','https://github.com/google-research/bert'),(45,'OpenAI Codex','AI model for generating code from text prompts','AI Coding Assistant','https://openai.com/research/codex'),(46,'GitHub Copilot','AI tool for generating code suggestions','AI Coding Assistant','https://github.com/features/copilot'),(47,'TabNine','AI-based code autocompletion tool','AI Coding Assistant','https://www.tabnine.com'),(48,'Lobe','A visual tool for building machine learning models','Machine Learning','https://www.lobe.ai'),(49,'Runway ML','An AI tool for creators to generate video, art, and content','Creative AI Tools','https://runwayml.com'),(50,'Fritz AI','A tool for building AI-powered mobile apps','Mobile AI Development','https://fritz.ai'),(51,'AI Dungeon','An interactive AI-powered text-based adventure game','AI Gaming','https://play.aidungeon.io'),(52,'AIVA','An AI tool for music composition','AI Music','https://www.aiva.ai'),(53,'Amper Music','AI-powered music composition and production','AI Music','https://www.ampermusic.com'),(54,'Boomy','AI-powered music creation tool','AI Music','https://boomy.com'),(55,'Descript','An AI-powered audio and video editing tool','AI Video Editing','https://www.descript.com');
/*!40000 ALTER TABLE `ai_tools` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-29 11:33:35
