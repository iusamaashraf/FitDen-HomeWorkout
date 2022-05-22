class StartExercise {
  String? imgPath;
  String? exerciseNmae;
  String? duration;
  StartExercise(
      {required this.duration,
      required this.exerciseNmae,
      required this.imgPath});
}

List<StartExercise> myPlan = [
  StartExercise(
    duration: 'x30',
    exerciseNmae: 'Sit-up Weist',
    imgPath: 'assets/animations/00011201-3-4-Sit-up_Waist.gif',
  ),
  StartExercise(
    duration: 'x30',
    exerciseNmae: 'Side-Bend_Waist',
    imgPath: 'assets/animations/00021201-45-Side-Bend_Waist.gif',
  ),
  StartExercise(
    duration: 'x30',
    exerciseNmae: 'Air-bike waist',
    imgPath: 'assets/animations/00031201-air-bike-m_waist.gif',
  ),
  StartExercise(
    duration: 'x30',
    exerciseNmae: 'Assisted-Chest-Dip-(kneeling) Chest',
    imgPath:
        'assets/animations/00091201-Assisted-Chest-Dip-(kneeling)_Chest.gif',
  ),
];
