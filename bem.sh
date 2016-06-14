#!/bin/bash
if [[ "$(cat /home/bem/status 2> /dev/null)" -ne "1" ]]; then
	# First run. Install bem
    git clone https://github.com/bem/project-stub.git --depth 1 --branch v${BEM_VERSION:='1.6.0'} /home/bem/${PROJECT_NAME:='my-bem-project'} && cd /home/bem/${PROJECT_NAME:='my-bem-project'}
    npm install
    echo "1" > /home/bem/status
fi
# Run enb server
cd /home/bem/${PROJECT_NAME:='my-bem-project'} && node_modules/.bin/enb server
