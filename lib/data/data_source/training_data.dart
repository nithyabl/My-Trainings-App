import 'package:flutter/material.dart';
import 'package:my_trainings_app/data/model/training_model.dart';

class TrainingData {
  static List<Training> trainings = [
    Training(
      id: 1,
      title: 'Flutter Development Basics',
      trainerName: 'John Doe',
      location: 'New York',
      summary:
          'Learn the fundamentals of Flutter development, including widgets, state management, layouts, navigation, and integrating APIs. Explore hands-on examples to master the concepts effectively. Collaborate with peers to build a small Flutter app by the end of the course. Perfect for anyone looking to start their journey in Flutter.',
      prerequisites: 'Basic programming knowledge in any language.',
      contactInfo: 'john.doe@trainings.com',
      cost: 199.99,
      trainingFromDate: DateTime(2024, 1, 15),
      trainingToDate: DateTime(2024, 2, 15),
      color: Colors.lightBlue.shade100,
    ),
    Training(
      id: 2,
      title: 'Advanced Flutter Techniques',
      trainerName: 'Jane Smith',
      location: 'San Francisco',
      summary:
          'Dive deeper into Flutter with advanced topics like custom animations, advanced state management techniques using Bloc and Riverpod, and integrating Firebase for backend support. Learn to optimize app performance with effective coding patterns. Work on real-world scenarios to enhance your skills. By the end, you’ll have a robust understanding of advanced Flutter capabilities.',
      prerequisites:
          'Completion of a beginner Flutter course or equivalent experience.',
      contactInfo: 'jane.smith@trainings.com',
      cost: 299.99,
      trainingFromDate: DateTime(2024, 2, 20),
      trainingToDate: DateTime(2024, 3, 20),
      color: Colors.pink.shade100,
    ),
    Training(
      id: 3,
      title: 'React Native for Beginners',
      trainerName: 'Alice Johnson',
      location: 'Los Angeles',
      summary:
          'An introduction to React Native, focusing on the basics of building cross-platform apps, including JSX, state and props, and integrating third-party libraries. Gain hands-on experience with tools and frameworks essential for React Native development. Understand best practices and common pitfalls. Build a functional cross-platform app as part of the course.',
      prerequisites: 'Basic understanding of JavaScript.',
      contactInfo: 'alice.johnson@trainings.com',
      cost: 249.99,
      trainingFromDate: DateTime(2024, 3, 1),
      trainingToDate: DateTime(2024, 3, 30),
      color: Colors.orange.shade100,
    ),
    Training(
      id: 4,
      title: 'UI/UX Design for Mobile Apps',
      trainerName: 'Robert Brown',
      location: 'Chicago',
      summary:
          'Learn the principles of UI/UX design, including user research, wireframing, prototyping, and usability testing. Delve into the psychology of design to create user-friendly interfaces. Understand the latest trends and technologies in mobile app design. Work on real-world design challenges to enhance your skills.',
      prerequisites: 'No prerequisites.',
      contactInfo: 'robert.brown@trainings.com',
      cost: 179.99,
      trainingFromDate: DateTime(2024, 4, 5),
      trainingToDate: DateTime(2024, 4, 25),
      color: Colors.green.shade100,
    ),
    Training(
      id: 5,
      title: 'Data Science with Python',
      trainerName: 'Michael Green',
      location: 'Austin',
      summary:
          'Learn how to analyze data, create visualizations, and apply machine learning techniques using Python libraries like Pandas, NumPy, and Scikit-learn. Gain expertise in statistical analysis and data preprocessing. Solve real-world problems with hands-on exercises. Build a portfolio-ready data science project by the end.',
      prerequisites: 'Basic Python programming knowledge.',
      contactInfo: 'michael.green@trainings.com',
      cost: 349.99,
      trainingFromDate: DateTime(2024, 5, 10),
      trainingToDate: DateTime(2024, 6, 10),
      color: Colors.yellow.shade100,
    ),
    Training(
      id: 6,
      title: 'Introduction to Artificial Intelligence',
      trainerName: 'Samantha White',
      location: 'Seattle',
      summary:
          'An introductory course to artificial intelligence concepts, including machine learning, neural networks, and the ethical implications of AI. Explore foundational algorithms and their applications. Understand how AI is transforming industries globally. Engage in interactive sessions to solidify theoretical concepts.',
      prerequisites: 'Basic math and programming knowledge.',
      contactInfo: 'samantha.white@trainings.com',
      cost: 399.99,
      trainingFromDate: DateTime(2024, 6, 15),
      trainingToDate: DateTime(2024, 7, 15),
      color: Colors.purple.shade100,
    ),
    Training(
      id: 7,
      title: 'Web Development with JavaScript',
      trainerName: 'David Lee',
      location: 'Miami',
      summary:
          'Learn how to build dynamic websites using HTML, CSS, and JavaScript. Understand DOM manipulation, API integration, and the basics of front-end frameworks. Work on real-time web applications to gain practical skills. By the end, you’ll have a strong foundation in web development.',
      prerequisites: 'No prerequisites.',
      contactInfo: 'david.lee@trainings.com',
      cost: 179.99,
      trainingFromDate: DateTime(2024, 7, 20),
      trainingToDate: DateTime(2024, 8, 20),
      color: Colors.blue.shade100,
    ),
  ];
}
