# mailman_config_changer

Changing the configuration of multiple mailman mailing lists

Steps:
- Write the altered config file in `config.conf`.
- Write all the mailinglists you want to reconfigre in `mailinglists.txt`.
- Run `./mailman_change.sh`.

Note:
You can save the current configuration via `config_list -o output.conf handsomepeople`.
It will only be changed what gets overwritten in `config.conf`, so preferences that should stay the same, don't need to be included in the fiel.
