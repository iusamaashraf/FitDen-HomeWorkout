import 'package:cloud_firestore/cloud_firestore.dart';

class ClassicList {
  String? image;
  String? title;
  int? noOfSets;
  String? description;
  ClassicList({
    required this.description,
    required this.image,
    required this.noOfSets,
    required this.title,
  });
  ClassicList.fromSnaphot(DocumentSnapshot data) {
    description = data['description'] ?? "";
    image = data['image'] ?? "";
    noOfSets = data['noOfSets'] ?? "";
    title = data['title'] ?? "";
  }
}

List<ClassicList> classList = [
  ClassicList(
      description:
          "Lie on your back with your knees up at a 90 degree angle and your hands behind your head. Lift your upper body and thighs, and then stretch out. Repeat this exercise.",
      image: 'assets/animations/00011201-3-4-Sit-up_Waist.gif',
      noOfSets: 8,
      title: 'Sit-up Weist'),
  ClassicList(
      description:
          "Securely attach a heavy rope to an anchor point, grab one end of the rope in each hand with the palms down. Stand with the feet about shoulder-width apart with both the hips and knees slightly bent, and hold both lines of rope directly in front. Hold one end of the rope in each hand and keep the elbows close to the body. Lift the right arm up quickly before snapping it down to create a wave down the rope. As the right arm comes down quickly, lift the left arm at the same time to start moving the left side of the rope. Alternate arms to explosively snap the rope up and down for the duration of the exercise. ",
      image: 'assets/animations/018201-Battling-Ropes.gif',
      noOfSets: 8,
      title: 'Battling Ropes'),
  ClassicList(
      description:
          "Lie on the floor with your hands behind your ears. Raise your knees and close your right elbow toward your left knee, then close your left elbow toward your right knee. Repeat the exercise.",
      image: 'assets/animations/00031201-air-bike-m_waist.gif',
      noOfSets: 8,
      title: 'Bicycle Crunches'),
  ClassicList(
      description:
          "Engage your core and your triceps and hinge at the elbow, lifting the dumbbell up and back as you try and straighten your arm. Your triceps should stay still; only your elbow moves. Guide the weight upward until your arm is straight, pause, then lower back to 90 degrees.",
      image: 'assets/animations/03331201-Dumbbell-Kickback_Upper-Arms.gif',
      noOfSets: 8,
      title: 'Dumbell Kick Back'),
  ClassicList(
      description:
          "    Grab two dumbbells and stand with your feet hip-width apart with a slight bend in your knees.Pretension your shoulders and hips while engaging your core. Initiate the upward movement by slowly lifting your arms away from your body.Pause at the top of the movement.",
      image: 'assets/animations/03341201-Dumbbell-Lateral-Raise_shoulder.gif',
      noOfSets: 8,
      title: 'Dumbell Lateral Raise Shoulder'),
  ClassicList(
      description:
          "While side bends won't make you bigger, they will do little on their own to make you smaller. Regular cardiovascular exercise is the most effective way to decrease body fat and decrease the width of your waist.",
      image: "assets/animations/00021201-45-Side-Bend_Waist.gif",
      noOfSets: 8,
      title: "Side Bend Waist"),
  ClassicList(
      description:
          "Begin standing tall with your feet about hip-width apart. Keep your abdominal muscles engaged. Hold one dumbbell in each hand. Let your arms relax down at the sides of your body with palms facing forward. Keeping your upper arms stable and shoulders relaxed, bend at the elbow and lift the weights so that the dumbbells approach your shoulders. Your elbows should stay tucked in close to your ribs. Exhale while lifting. Lower the weights to the starting position.",
      image:
          'assets/animations/00231201-Barbell-Alternate-Biceps-Curl_Upper-Arms.gif',
      noOfSets: 8,
      title: 'Barbell Alternate Biceps Curl'),
  ClassicList(
      description:
          "While side bends won't make you bigger, they will do little on their own to make you smaller. Regular cardiovascular exercise is the most effective way to decrease body fat and decrease the width of your waist.",
      image:
          "assets/animations/00961201-Barbell-Side-Bent-(version-2)_Waist.gif",
      noOfSets: 8,
      title: 'Barbell Side Bent Waist'),
  ClassicList(
      description:
          "Lie back and raise the dumbbells above your head using a neutral grip, palms facing each other. Bending at the elbows and keeping your upper arms set, lower the dumbbells until they are about level with your ears. Squeeze your triceps and raise the dumbbells back to the starting position.",
      image:
          "assets/animations/03371201-Dumbbell-Lying-Extension-(across-face)_Upper-Arms.gif",
      noOfSets: 8,
      title: "Dumbbell Lying Extension (across-face) Upper Arms"),
  ClassicList(
      description:
          "As you lower the bar, keep your back arched, your shoulders down and back, and focus on resisting and pushing with your chest muscles. Keeping your back arched and shoulders back is how you will feel bench press in your chest. Safety is always the number one priority in weightlifting.",
      image: "assets/animations/03401201-Dumbbell-Lying-Hammer-Press_Chest.gif",
      noOfSets: 8,
      title: "Dumbbell Lying Hammer Press Chest"),
  ClassicList(
      description:
          "    Lie flat on a bench while holding a dumbbell at arms length.Place your non lifting hand on your bicep for support. Slowly begin to lower the dumbbell down as you breathe in. Then, begin lifting the dumbbell upward as you contract the triceps.",
      image:
          "assets/animations/03441201-Dumbbell-Lying-One-Arm-Pronated-Triceps-Extension_Upper-Arms.gif",
      noOfSets: 8,
      title: "Dumbbell Lying One Arm Pronated Triceps Extension Upper Arms"),
  ClassicList(
      description:
          "Lie back and raise the dumbbells above your head using a neutral grip, palms facing each other. Bending at the elbows and keeping your upper arms set, lower the dumbbells until they are about level with your ears. Squeeze your triceps and raise the dumbbells back to the starting position.",
      image:
          "assets/animations/03461201-Dumbbell-Lying-One-Arm-Supinated-Triceps-Extension_Upper-Arms.gif",
      noOfSets: 8,
      title: "Dumbbell Lying One Arm Supinated Triceps Extension Upper Arms")
];

class WeightLoose {
  String? image;
  String? title;
  int? noOfSets;
  String? description;
  WeightLoose({
    required this.description,
    required this.image,
    required this.noOfSets,
    required this.title,
  });
}

List<WeightLoose> looseList = [
  WeightLoose(
      description:
          'Standing calf raises focus primarily on your gastrocnemius, which is the calf muscle at the back of your shins. Seated calf raises, whilst working your gastrocnemius, also work your soleus which is located higher up behind the knee.',
      image:
          'assets/animations/04171201-Dumbbell-Standing-Calf-Raise_Calves.gif',
      noOfSets: 12,
      title: 'Dumbbell Standing Calf Raise Calves'),
  WeightLoose(
      description:
          'The dumbbell concentration curl primarily works your biceps brachii. The bicep muscle is comprised of two “heads:” a long head and a short head. Both heads work together as a cohesive unit during lifting and pulling motions.',
      image:
          'assets/animations/04181201-Dumbbell-Standing-Concentration-Curl_Upper-Arms.gif',
      noOfSets: 12,
      title: 'Dumbbell Standing Concentration Curl Upper Arms'),
  WeightLoose(
      description:
          "Image result for Dumbbell-Standing-Front-Raise-Above-Head_Shoulders way The dumbbell overhead press can be done in either a sitting or standing position and with dumbbells held horizontally at the shoulders or rotated in a hammer grip. You can use this exercise in any upper body strength workout. Also Known As: Dumbbell shoulder press.",
      image:
          'assets/animations/04191201-Dumbbell-Standing-Front-Raise-Above-Head_Shoulders.gif',
      noOfSets: 12,
      title: 'Dumbbell Standing Front Raise Above Head Shoulders'),
  WeightLoose(
      description:
          "Start by standing with your feet shoulder width apart, knees bent at around 25-degrees, your hands holding dumbbells with your elbows bent at 90-degrees. 2.) Bend your body forward so that the dumbbells are parallel with your legs and then slowly lift the dumbbells behind you so that you feel a stretch in your triceps.",
      image:
          'assets/animations/04201201-Dumbbell-Standing-Kickback_Upper-Arms.gif',
      noOfSets: 12,
      title: 'Dumbbell Standing Kickback Upper Arms'),
  WeightLoose(
      description:
          "Lie on your back with your knees up at a 90 degree angle and your hands behind your head. Lift your upper body and thighs, and then stretch out. Repeat this exercise.",
      image: 'assets/animations/00011201-3-4-Sit-up_Waist.gif',
      noOfSets: 8,
      title: 'Sit-up Weist'),
  WeightLoose(
      description:
          "Securely attach a heavy rope to an anchor point, grab one end of the rope in each hand with the palms down. Stand with the feet about shoulder-width apart with both the hips and knees slightly bent, and hold both lines of rope directly in front. Hold one end of the rope in each hand and keep the elbows close to the body. Lift the right arm up quickly before snapping it down to create a wave down the rope. As the right arm comes down quickly, lift the left arm at the same time to start moving the left side of the rope. Alternate arms to explosively snap the rope up and down for the duration of the exercise. ",
      image: 'assets/animations/018201-Battling-Ropes.gif',
      noOfSets: 8,
      title: 'Battling Ropes'),
  WeightLoose(
      description:
          "Lie on the floor with your hands behind your ears. Raise your knees and close your right elbow toward your left knee, then close your left elbow toward your right knee. Repeat the exercise.",
      image: 'assets/animations/00031201-air-bike-m_waist.gif',
      noOfSets: 8,
      title: 'Bicycle Crunches'),
  WeightLoose(
      description:
          "Engage your core and your triceps and hinge at the elbow, lifting the dumbbell up and back as you try and straighten your arm. Your triceps should stay still; only your elbow moves. Guide the weight upward until your arm is straight, pause, then lower back to 90 degrees.",
      image: 'assets/animations/03331201-Dumbbell-Kickback_Upper-Arms.gif',
      noOfSets: 8,
      title: 'Dumbell Kick Back'),
  WeightLoose(
      description:
          "Grab two dumbbells and stand with your feet hip-width apart with a slight bend in your knees.Pretension your shoulders and hips while engaging your core. Initiate the upward movement by slowly lifting your arms away from your body.Pause at the top of the movement.",
      image: 'assets/animations/03341201-Dumbbell-Lateral-Raise_shoulder.gif',
      noOfSets: 8,
      title: 'Dumbell Lateral Raise Shoulder'),
  WeightLoose(
      description:
          "While side bends won't make you bigger, they will do little on their own to make you smaller. Regular cardiovascular exercise is the most effective way to decrease body fat and decrease the width of your waist.",
      image: "assets/animations/00021201-45-Side-Bend_Waist.gif",
      noOfSets: 8,
      title: "Side Bend Waist"),
  WeightLoose(
      description:
          "Begin standing tall with your feet about hip-width apart. Keep your abdominal muscles engaged. Hold one dumbbell in each hand. Let your arms relax down at the sides of your body with palms facing forward. Keeping your upper arms stable and shoulders relaxed, bend at the elbow and lift the weights so that the dumbbells approach your shoulders. Your elbows should stay tucked in close to your ribs. Exhale while lifting. Lower the weights to the starting position.",
      image:
          'assets/animations/00231201-Barbell-Alternate-Biceps-Curl_Upper-Arms.gif',
      noOfSets: 8,
      title: 'Barbell Alternate Biceps Curl'),
  WeightLoose(
      description:
          "While side bends won't make you bigger, they will do little on their own to make you smaller. Regular cardiovascular exercise is the most effective way to decrease body fat and decrease the width of your waist.",
      image:
          "assets/animations/00961201-Barbell-Side-Bent-(version-2)_Waist.gif",
      noOfSets: 8,
      title: 'Barbell Side Bent Waist'),
  WeightLoose(
      description:
          "Lie back and raise the dumbbells above your head using a neutral grip, palms facing each other. Bending at the elbows and keeping your upper arms set, lower the dumbbells until they are about level with your ears. Squeeze your triceps and raise the dumbbells back to the starting position.",
      image:
          "assets/animations/03371201-Dumbbell-Lying-Extension-(across-face)_Upper-Arms.gif",
      noOfSets: 8,
      title: "Dumbbell Lying Extension (across-face) Upper Arms"),
  WeightLoose(
      description:
          "As you lower the bar, keep your back arched, your shoulders down and back, and focus on resisting and pushing with your chest muscles. Keeping your back arched and shoulders back is how you will feel bench press in your chest. Safety is always the number one priority in weightlifting.",
      image: "assets/animations/03401201-Dumbbell-Lying-Hammer-Press_Chest.gif",
      noOfSets: 8,
      title: "Dumbbell Lying Hammer Press Chest"),
  WeightLoose(
      description:
          "Lie flat on a bench while holding a dumbbell at arms length.Place your non lifting hand on your bicep for support. Slowly begin to lower the dumbbell down as you breathe in. Then, begin lifting the dumbbell upward as you contract the triceps.",
      image:
          "assets/animations/03441201-Dumbbell-Lying-One-Arm-Pronated-Triceps-Extension_Upper-Arms.gif",
      noOfSets: 8,
      title: "Dumbbell Lying One Arm Pronated Triceps Extension Upper Arms"),
  WeightLoose(
      description:
          "Lie back and raise the dumbbells above your head using a neutral grip, palms facing each other. Bending at the elbows and keeping your upper arms set, lower the dumbbells until they are about level with your ears. Squeeze your triceps and raise the dumbbells back to the starting position.",
      image:
          "assets/animations/03461201-Dumbbell-Lying-One-Arm-Supinated-Triceps-Extension_Upper-Arms.gif",
      noOfSets: 8,
      title: "Dumbbell Lying One Arm Supinated Triceps Extension Upper Arms")
];

class WeightGain {
  String? image;
  String? title;
  int? noOfSets;
  String? description;
  WeightGain({
    required this.description,
    required this.image,
    required this.noOfSets,
    required this.title,
  });
}

List<WeightGain> gainList = [
  WeightGain(
      description:
          'Standing calf raises focus primarily on your gastrocnemius, which is the calf muscle at the back of your shins. Seated calf raises, whilst working your gastrocnemius, also work your soleus which is located higher up behind the knee.',
      image:
          'assets/animations/04171201-Dumbbell-Standing-Calf-Raise_Calves.gif',
      noOfSets: 10,
      title: 'Dumbbell Standing Calf Raise Calves'),
  WeightGain(
      description:
          'The dumbbell concentration curl primarily works your biceps brachii. The bicep muscle is comprised of two “heads:” a long head and a short head. Both heads work together as a cohesive unit during lifting and pulling motions.',
      image:
          'assets/animations/04181201-Dumbbell-Standing-Concentration-Curl_Upper-Arms.gif',
      noOfSets: 10,
      title: 'Dumbbell Standing Concentration Curl Upper Arms'),
  WeightGain(
      description:
          "Image result for Dumbbell-Standing-Front-Raise-Above-Head_Shoulders way The dumbbell overhead press can be done in either a sitting or standing position and with dumbbells held horizontally at the shoulders or rotated in a hammer grip. You can use this exercise in any upper body strength workout. Also Known As: Dumbbell shoulder press.",
      image:
          'assets/animations/04191201-Dumbbell-Standing-Front-Raise-Above-Head_Shoulders.gif',
      noOfSets: 10,
      title: 'Dumbbell Standing Front Raise Above Head Shoulders'),
  WeightGain(
      description:
          "Securely attach a heavy rope to an anchor point, grab one end of the rope in each hand with the palms down. Stand with the feet about shoulder-width apart with both the hips and knees slightly bent, and hold both lines of rope directly in front. Hold one end of the rope in each hand and keep the elbows close to the body. Lift the right arm up quickly before snapping it down to create a wave down the rope. As the right arm comes down quickly, lift the left arm at the same time to start moving the left side of the rope. Alternate arms to explosively snap the rope up and down for the duration of the exercise. ",
      image: 'assets/animations/018201-Battling-Ropes.gif',
      noOfSets: 10,
      title: 'Battling Ropes'),
  WeightGain(
      description:
          "Lie on the floor with your hands behind your ears. Raise your knees and close your right elbow toward your left knee, then close your left elbow toward your right knee. Repeat the exercise.",
      image: 'assets/animations/00031201-air-bike-m_waist.gif',
      noOfSets: 10,
      title: 'Bicycle Crunches'),
  WeightGain(
      description:
          "Engage your core and your triceps and hinge at the elbow, lifting the dumbbell up and back as you try and straighten your arm. Your triceps should stay still; only your elbow moves. Guide the weight upward until your arm is straight, pause, then lower back to 90 degrees.",
      image: 'assets/animations/03331201-Dumbbell-Kickback_Upper-Arms.gif',
      noOfSets: 10,
      title: 'Dumbell Kick Back'),
  WeightGain(
      description:
          "    Grab two dumbbells and stand with your feet hip-width apart with a slight bend in your knees.Pretension your shoulders and hips while engaging your core. Initiate the upward movement by slowly lifting your arms away from your body.Pause at the top of the movement.",
      image: 'assets/animations/03341201-Dumbbell-Lateral-Raise_shoulder.gif',
      noOfSets: 10,
      title: 'Dumbell Lateral Raise Shoulder'),
  WeightGain(
      description:
          "While side bends won't make you bigger, they will do little on their own to make you smaller. Regular cardiovascular exercise is the most effective way to decrease body fat and decrease the width of your waist.",
      image: "assets/animations/00021201-45-Side-Bend_Waist.gif",
      noOfSets: 10,
      title: "Side Bend Waist"),
  WeightGain(
      description:
          "Begin standing tall with your feet about hip-width apart. Keep your abdominal muscles engaged. Hold one dumbbell in each hand. Let your arms relax down at the sides of your body with palms facing forward. Keeping your upper arms stable and shoulders relaxed, bend at the elbow and lift the weights so that the dumbbells approach your shoulders. Your elbows should stay tucked in close to your ribs. Exhale while lifting. Lower the weights to the starting position.",
      image:
          'assets/animations/00231201-Barbell-Alternate-Biceps-Curl_Upper-Arms.gif',
      noOfSets: 10,
      title: 'Barbell Alternate Biceps Curl'),
  WeightGain(
      description:
          "While side bends won't make you bigger, they will do little on their own to make you smaller. Regular cardiovascular exercise is the most effective way to decrease body fat and decrease the width of your waist.",
      image:
          "assets/animations/00961201-Barbell-Side-Bent-(version-2)_Waist.gif",
      noOfSets: 10,
      title: 'Barbell Side Bent Waist'),
  WeightGain(
      description:
          "Lie back and raise the dumbbells above your head using a neutral grip, palms facing each other. Bending at the elbows and keeping your upper arms set, lower the dumbbells until they are about level with your ears. Squeeze your triceps and raise the dumbbells back to the starting position.",
      image:
          "assets/animations/03371201-Dumbbell-Lying-Extension-(across-face)_Upper-Arms.gif",
      noOfSets: 10,
      title: "Dumbbell Lying Extension (across-face) Upper Arms"),
  WeightGain(
      description:
          "As you lower the bar, keep your back arched, your shoulders down and back, and focus on resisting and pushing with your chest muscles. Keeping your back arched and shoulders back is how you will feel bench press in your chest. Safety is always the number one priority in weightlifting.",
      image: "assets/animations/03401201-Dumbbell-Lying-Hammer-Press_Chest.gif",
      noOfSets: 10,
      title: "Dumbbell Lying Hammer Press Chest"),
  WeightGain(
      description:
          "Lie flat on a bench while holding a dumbbell at arms length.Place your non lifting hand on your bicep for support. Slowly begin to lower the dumbbell down as you breathe in. Then, begin lifting the dumbbell upward as you contract the triceps.",
      image:
          "assets/animations/03441201-Dumbbell-Lying-One-Arm-Pronated-Triceps-Extension_Upper-Arms.gif",
      noOfSets: 10,
      title: "Dumbbell Lying One Arm Pronated Triceps Extension Upper Arms"),
  WeightGain(
      description:
          "Lie back and raise the dumbbells above your head using a neutral grip, palms facing each other. Bending at the elbows and keeping your upper arms set, lower the dumbbells until they are about level with your ears. Squeeze your triceps and raise the dumbbells back to the starting position.",
      image:
          "assets/animations/03461201-Dumbbell-Lying-One-Arm-Supinated-Triceps-Extension_Upper-Arms.gif",
      noOfSets: 10,
      title: "Dumbbell Lying One Arm Supinated Triceps Extension Upper Arms")
];

//here is
class DayWiseExerciseModel {
  String? day;
  String? id;
  String? description;
  bool? isStart;
  DayWiseExerciseModel({
    this.day,
    this.id,
    this.description,
    this.isStart,
  });
  DayWiseExerciseModel.fromSnapshot(DocumentSnapshot data) {
    id = data.id;
    day = data['day'] ?? "";
    description = data['description'] ?? "";
    isStart = data['isStart'] ?? "";
  }
}

class ExerciseTypeModel {
  String? id;
  String? exerciseType;
  ExerciseTypeModel({
    this.id,
    this.exerciseType,
  });
  ExerciseTypeModel.fromSnapshot(DocumentSnapshot data) {
    id = data.id;
    exerciseType = data['exercisetype'] ?? "";
  }
}
