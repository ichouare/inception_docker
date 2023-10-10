#!/bin/bash

service  mariadb start  && mysql -u root <<"./core.sql"
