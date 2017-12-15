#!/bin/bash

trap after_eval INT

COUNT=0

function after_eval() {
  COUNT=$(( COUNT + 1 ))
  if [ $COUNT -eq 1 ]; then
    python collect_anime_infos.py && python convert_to_features.py && python anime_reccomend.py
  fi
}

python eval_animes.py && after_eval
