FactoryBot.define do
  exercises = [
    "Bench Press",
    "Military Press",
    "Skin The Cat",
    "KB Swing",
    "Farmer Carries",
    "Burpees",
    "Front Squat",
    "Chainsaw"
  ]

  factory(:workout_item) do
    workout
    title { exercises.sample }
  end
end
