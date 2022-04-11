powershell -Command "& Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force"
powershell -Command ". { iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force"