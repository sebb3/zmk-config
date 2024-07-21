#!/usr/bin/env bash

cd $HOME/keymap-drawer
export POETRY_ENV=`poetry env info -p`/bin/activate && . ${POETRY_ENV}

output_folder="keymap-drawer"
config_path="keymap-drawer/config.yaml"
keymap_file="config/hypergolic.keymap"
draw_args="-k ferris/sweep"

config_arg=(-c "$config_path")
keyboard=$(basename -s .keymap "$keymap_file")

cd $HOME/zmk-config

keymap "${config_arg[@]}" parse -z "$keymap_file" $parse_args >"$output_folder/$keyboard.yaml"

keymap "${config_arg[@]}" draw "$output_folder/$keyboard.yaml" $draw_args --keys-only >"$output_folder/$keyboard.svg"

keymap "${config_arg[@]}" draw "$output_folder/$keyboard.yaml" $draw_args --combos-only --select-layers base >"$output_folder/${keyboard}_combos.svg"
