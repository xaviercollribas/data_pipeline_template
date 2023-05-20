#!/bin/bash

jupytext --to py formatted_zone.ipynb
jupytext --to py download_data.ipynb
jupytext --to py persistent_zone.ipynb
