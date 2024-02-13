#!/bin/env bash

SERVER_CONFIG_FOLDER='/root/.rcssserver'

DEFAULT_CONFIG=(
    'version' '18.1.2'
    'catch_ban_cycle' 5
    'clang_advice_win' 1
    'clang_define_win' 1
    'clang_del_win' 1
    'clang_info_win' 1
    'clang_mess_delay' 50
    'clang_mess_per_cycle' 1
    'clang_meta_win' 1
    'clang_rule_win' 1
    'clang_win_size' 300
    'coach_port' 6001
    'connect_wait' 300
    'drop_ball_time' 100
    'extra_half_time' 100
    'foul_cycles' 5
    'freeform_send_period' 20
    'freeform_wait_period' 600
    'game_log_compression' 0
    'game_log_version' 6
    'game_over_wait' 100
    'goalie_max_moves' 2
    'half_time' 300
    'hear_decay' 1
    'hear_inc' 1
    'hear_max' 1
    'illegal_defense_duration' 20
    'illegal_defense_number' 0
    'keepaway_start' -1
    'kick_off_wait' 100
    'max_goal_kicks' 3
    'max_monitors' -1
    'nr_extra_halfs' 2
    'nr_normal_halfs' 2
    'olcoach_port' 6002
    'pen_before_setup_wait' 10
    'pen_max_extra_kicks' 5
    'pen_nr_kicks' 5
    'pen_ready_wait' 10
    'pen_setup_wait' 70
    'pen_taken_wait' 150
    'point_to_ban' 5
    'point_to_duration' 20
    'port' 6000
    'recv_step' 10
    'say_coach_cnt_max' 128
    'say_coach_msg_size' 128
    'say_msg_size' 10
    'send_step' 150
    'send_vi_step' 100
    'sense_body_step' 100
    'simulator_step' 100
    'slow_down_factor' 1
    'start_goal_l' 0
    'start_goal_r' 0
    'synch_micro_sleep' 1
    'synch_offset' 60
    'synch_see_offset' 0
    'tackle_cycles' 10
    'text_log_compression' 0
    'auto_mode' false
    'back_passes' true
    'coach' false
    'coach_w_referee' false
    'forbid_kick_off_offside' true
    'free_kick_faults' true
    'fullstate_l' false
    'fullstate_r' false
    'game_log_dated' true
    'game_log_fixed' false
    'game_logging' true
    'golden_goal' false
    'keepaway' false
    'keepaway_log_dated' true
    'keepaway_log_fixed' false
    'keepaway_logging' true
    'log_times' false
    'old_coach_hear' false
    'pen_allow_mult_kicks' true
    'pen_coach_moves_players' true
    'pen_random_winner' false
    'penalty_shoot_outs' true
    'profile' false
    'proper_goal_kicks' false
    'record_messages' false
    'send_comms' false
    'synch_mode' false
    'team_actuator_noise' false
    'text_log_dated' true
    'text_log_fixed' false
    'text_logging' true
    'use_offside' true
    'verbose' false
    'wind_none' false
    'wind_random' false
    'audio_cut_dist' 50
    'back_dash_rate' 0.7
    'ball_accel_max' 2.7
    'ball_decay' 0.94
    'ball_rand' 0.05
    'ball_size' 0.085
    'ball_speed_max' 3
    'ball_stuck_area' 3
    'ball_weight' 0.2
    'catch_probability' 1
    'catchable_area_l' 1.2
    'catchable_area_w' 1
    'ckick_margin' 1
    'control_radius' 2
    'dash_angle_step' 1
    'dash_power_rate' 0.006
    'effort_dec' 0.005
    'effort_dec_thr' 0.3
    'effort_inc' 0.01
    'effort_inc_thr' 0.6
    'effort_init' 1
    'effort_min' 0.6
    'extra_stamina' 50
    'foul_detect_probability' 0.5
    'foul_exponent' 10
    'goal_width' 14.02
    'illegal_defense_dist_x' 16.5
    'illegal_defense_width' 40.32
    'inertia_moment' 5
    'keepaway_length' 20
    'keepaway_width' 20
    'kick_power_rate' 0.027
    'kick_rand' 0.1
    'kick_rand_factor_l' 1
    'kick_rand_factor_r' 1
    'kickable_margin' 0.7
    'max_back_tackle_power' 0
    'max_catch_angle' 90
    'max_dash_angle' 180
    'max_dash_power' 100
    'max_tackle_power' 100
    'maxmoment' 180
    'maxneckang' 90
    'maxneckmoment' 180
    'maxpower' 100
    'min_catch_angle' -90
    'min_dash_angle' -180
    'min_dash_power' 0
    'minmoment' -180
    'minneckang' -90
    'minneckmoment' -180
    'minpower' -100
    'offside_active_area_size' 2.5
    'offside_kick_margin' 9.15
    'pen_dist_x' 42.5
    'pen_max_goalie_dist_x' 14
    'player_accel_max' 1
    'player_decay' 0.4
    'player_rand' 0.1
    'player_size' 0.3
    'player_speed_max' 1.05
    'player_speed_max_min' 0.75
    'player_weight' 60
    'prand_factor_l' 1
    'prand_factor_r' 1
    'quantize_step' 0.1
    'quantize_step_l' 0.01
    'recover_dec' 0.002
    'recover_dec_thr' 0.3
    'recover_init' 1
    'recover_min' 0.5
    'red_card_probability' 0
    'side_dash_rate' 0.4
    'slowness_on_top_for_left_team' 1
    'slowness_on_top_for_right_team' 1
    'stamina_capacity' 130600
    'stamina_inc_max' 45
    'stamina_max' 8000
    'stopped_ball_vel' 0.01
    'tackle_back_dist' 0
    'tackle_dist' 2
    'tackle_exponent' 6
    'tackle_power_rate' 0.027
    'tackle_rand_factor' 2
    'tackle_width' 1.25
    'visible_angle' 90
    'visible_distance' 3
    'wind_ang' 0
    'wind_dir' 0
    'wind_force' 0
    'wind_rand' 0
    'coach_msg_file' ''
    'fixed_teamname_l' ''
    'fixed_teamname_r' ''
    'game_log_dir' './'
    'game_log_fixed_name' 'rcssserver'
    'keepaway_log_dir' './'
    'keepaway_log_fixed_name' 'rcssserver'
    'landmark_file' '~/.rcssserver-landmark.xml'
    'log_date_format' '%Y%m%d%H%M%S-'
    'team_l_start' ''
    'team_r_start' ''
    'text_log_dir' './'
    'text_log_fixed_name' 'rcssserver'
)

# if server config does exist then run with it
if [ -f "${SERVER_CONFIG_FOLDER}/server.conf" ]; then
    rcssserver 
fi


# loop through the default values if they are in the environment variable change the array value
for ((i=0; i<${#DEFAULT_CONFIG[@]}; i+=2)); do
    if [ -n "${!DEFAULT_CONFIG[i]}" ]; then
        DEFAULT_CONFIG[i+1]="${!DEFAULT_CONFIG[i]}"
        echo "ENV Loaded ${DEFAULT_CONFIG[i]}=${DEFAULT_CONFIG[i+1]}"
    fi
done

# run server with options
opt=""
for ((i=0; i<${#DEFAULT_CONFIG[@]}; i+=2)); do
    opt="${opt} server::${DEFAULT_CONFIG[i]}=${DEFAULT_CONFIG[i+1]}"
done

echo "Running server with options: ${opt}"
rcssserver ${opt}


