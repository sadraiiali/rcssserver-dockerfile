#!/bin/env bash

SERVER_CONFIG_FOLDER='/root/.rcssserver'
LOGS_FOLDER='/root/rcssserver-logs'

mkdir -p ${LOGS_FOLDER}

SERVER_OPTIONS=(
    'catch_ban_cycle' ''
    'clang_advice_win' ''
    'clang_define_win' ''
    'clang_del_win' ''
    'clang_info_win' ''
    'clang_mess_delay' ''
    'clang_mess_per_cycle' ''
    'clang_meta_win' ''
    'clang_rule_win' ''
    'clang_win_size' ''
    'coach_port' ''
    'connect_wait' ''
    'drop_ball_time' ''
    'extra_half_time' ''
    'foul_cycles' ''
    'freeform_send_period' ''
    'freeform_wait_period' ''
    'game_log_compression' ''
    'game_log_version' ''
    'game_over_wait' ''
    'goalie_max_moves' ''
    'half_time' ''
    'hear_decay' ''
    'hear_inc' ''
    'hear_max' ''
    'illegal_defense_duration' ''
    'illegal_defense_number' ''
    'keepaway_start' ''
    'kick_off_wait' ''
    'max_goal_kicks' ''
    'max_monitors' ''
    'nr_extra_halfs' ''
    'nr_normal_halfs' ''
    'olcoach_port' ''
    'pen_before_setup_wait' ''
    'pen_max_extra_kicks' ''
    'pen_nr_kicks' ''
    'pen_ready_wait' ''
    'pen_setup_wait' ''
    'pen_taken_wait' ''
    'point_to_ban' ''
    'point_to_duration' ''
    'port' ''
    'recv_step' ''
    'say_coach_cnt_max' ''
    'say_coach_msg_size' ''
    'say_msg_size' ''
    'send_step' ''
    'send_vi_step' ''
    'sense_body_step' ''
    'simulator_step' ''
    'slow_down_factor' ''
    'start_goal_l' ''
    'start_goal_r' ''
    'synch_micro_sleep' ''
    'synch_offset' ''
    'synch_see_offset' ''
    'tackle_cycles' ''
    'text_log_compression' ''
    'auto_mode' ''
    'back_passes' ''
    'coach' ''
    'coach_w_referee' ''
    'forbid_kick_off_offside' ''
    'free_kick_faults' ''
    'fullstate_l' ''
    'fullstate_r' ''
    'game_log_dated' ''
    'game_log_fixed' ''
    'game_logging' ''
    'golden_goal' ''
    'keepaway' ''
    'keepaway_log_dated' ''
    'keepaway_log_fixed' ''
    'keepaway_logging' ''
    'log_times' ''
    'old_coach_hear' ''
    'pen_allow_mult_kicks' ''
    'pen_coach_moves_players' ''
    'pen_random_winner' ''
    'penalty_shoot_outs' ''
    'profile' ''
    'proper_goal_kicks' ''
    'record_messages' ''
    'send_comms' ''
    'synch_mode' ''
    'team_actuator_noise' ''
    'text_log_dated' ''
    'text_log_fixed' ''
    'text_logging' ''
    'use_offside' ''
    'verbose' ''
    'wind_none' ''
    'wind_random' ''
    'audio_cut_dist' ''
    'back_dash_rate' ''
    'ball_accel_max' ''
    'ball_decay' ''
    'ball_rand' ''
    'ball_size' ''
    'ball_speed_max' ''
    'ball_stuck_area' ''
    'ball_weight' ''
    'catch_probability' ''
    'catchable_area_l' ''
    'catchable_area_w' ''
    'ckick_margin' ''
    'control_radius' ''
    'dash_angle_step' ''
    'dash_power_rate' ''
    'effort_dec' ''
    'effort_dec_thr' ''
    'effort_inc' ''
    'effort_inc_thr' ''
    'effort_init' ''
    'effort_min' ''
    'extra_stamina' ''
    'foul_detect_probability' ''
    'foul_exponent' ''
    'goal_width' ''
    'illegal_defense_dist_x' ''
    'illegal_defense_width' ''
    'inertia_moment' ''
    'keepaway_length' ''
    'keepaway_width' ''
    'kick_power_rate' ''
    'kick_rand' ''
    'kick_rand_factor_l' ''
    'kick_rand_factor_r' ''
    'kickable_margin' ''
    'max_back_tackle_power' ''
    'max_catch_angle' ''
    'max_dash_angle' ''
    'max_dash_power' ''
    'max_tackle_power' ''
    'maxmoment' ''
    'maxneckang' ''
    'maxneckmoment' ''
    'maxpower' ''
    'min_catch_angle' ''
    'min_dash_angle' ''
    'min_dash_power' ''
    'minmoment' ''
    'minneckang' ''
    'minneckmoment' ''
    'minpower' ''
    'offside_active_area_size' ''
    'offside_kick_margin' ''
    'pen_dist_x' ''
    'pen_max_goalie_dist_x' ''
    'player_accel_max' ''
    'player_decay' ''
    'player_rand' ''
    'player_size' ''
    'player_speed_max' ''
    'player_speed_max_min' ''
    'player_weight' ''
    'prand_factor_l' ''
    'prand_factor_r' ''
    'quantize_step' ''
    'quantize_step_l' ''
    'recover_dec' ''
    'recover_dec_thr' ''
    'recover_init' ''
    'recover_min' ''
    'red_card_probability' ''
    'side_dash_rate' ''
    'slowness_on_top_for_left_team' ''
    'slowness_on_top_for_right_team' ''
    'stamina_capacity' ''
    'stamina_inc_max' ''
    'stamina_max' ''
    'stopped_ball_vel' ''
    'tackle_back_dist' ''
    'tackle_dist' ''
    'tackle_exponent' ''
    'tackle_power_rate' ''
    'tackle_rand_factor' ''
    'tackle_width' ''
    'visible_angle' ''
    'visible_distance' ''
    'wind_ang' ''
    'wind_dir' ''
    'wind_force' ''
    'wind_rand' ''
    'coach_msg_file' ''
    'fixed_teamname_l' ''
    'fixed_teamname_r' ''
    'game_log_dir' "${LOGS_FOLDER}"
    'game_log_fixed_name' ''
    'keepaway_log_dir' "${LOGS_FOLDER}"
    'keepaway_log_fixed_name' ''
    'landmark_file' ''
    'log_date_format' ''
    'team_l_start' ''
    'team_r_start' ''
    'text_log_dir' "${LOGS_FOLDER}"
    'text_log_fixed_name' ''
)

# First Config Priority : Server Config files
# if server config does exist then run with it
if [ -f "${SERVER_CONFIG_FOLDER}/server.conf" ]; then
    rcssserver 
    exit 0
fi

# Second Config Priority : Environment Variables
# if environment variables are set then run with them
# loop through the default values if they are in the environment variable change the array value
for ((i=0; i<${#SERVER_OPTIONS[@]}; i+=2)); do
    if [ -n "${!SERVER_OPTIONS[i]}" ]; then
        SERVER_OPTIONS[i+1]="${!SERVER_OPTIONS[i]}"
        echo "ENV Loaded ${SERVER_OPTIONS[i]}=${SERVER_OPTIONS[i+1]}"
    fi
done

# run server with options
opt=""
for ((i=0; i<${#SERVER_OPTIONS[@]}; i+=2)); do
    if [ -n "${SERVER_OPTIONS[i+1]}" ]; then
        opt="${opt} server::${SERVER_OPTIONS[i]}=${SERVER_OPTIONS[i+1]}"
    fi
done

echo "Running server with options: ${opt}"
rcssserver ${opt}


