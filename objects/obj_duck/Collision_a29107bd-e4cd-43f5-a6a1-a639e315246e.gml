/// @description Eat

points += other.value;
show_debug_message(points);
instance_destroy(other);
audio_play_sound(snd_eat, 0, false);