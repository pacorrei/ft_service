RED='\033[0;31m'
GREEN='\033[0;32m'
L_GREEN='\033[1;32m'
L_BLUE='\033[1;34m'
L_GRAY='\033[0;37m'
L_PURPLE='\033[1;35m'
BOLD='\033[1m'
NC='\033[0m'


echo -e  "$L_GRAY - minikube clean up $NC"
minikube delete 2> /dev/null
echo -e "$L_GREEN - minikube was clean up $NC"
sleep 5

echo -e "$L_GRAY - start minikube $NC"
minikube start --driver=docker
echo -e "$L_GREEN - minikube is running! $NC"
sleep 5

MY_IP=$(minikube ip)

#for use docker daemon from minikube
eval $(minikube docker-env)

KubeIP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)

#echo $KubeIP
#build container

echo -e "$L_GRAY - build nginx...$NC"
docker build -t	service_nginx srcs/nginx > /dev/null
echo -e "$L_GREEN - nginx is build !$NC"

echo -e "$L_GRAY - build ftps... $NC"
docker build -t service_ftps srcs/ftps > /dev/null
echo -e "$L_GREEN - ftps is build !$NC"

echo -e "$L_GRAY - build mysql... $NC"
docker build -t service_mysql srcs/mysql > /dev/null
echo -e  "$L_GREEN - mysql is build !$NC"

echo -e "$L_GRAY - build phpmyadpmin... $NC"
docker build -t service_php srcs/phpmyadmin > /dev/null
echo -e "$L_GREEN - phpmyadmin is build !$NC"

echo -e "$L_GRAY - build wordpress... $NC"
docker build -t service_wordpress srcs/wordpress > /dev/null
echo -e "$L_GREEN - wordpress is build !$NC"

echo -e "$L_GRAY - build grafana... $NC"
docker build -t service_grafana srcs/grafana > /dev/null
echo -e "$L_GREEN - grafana is build !$NC"

echo -e "$L_GRAY - build influxdb... $NC"
docker build -t service_influxdb srcs/influxdb > /dev/null
echo -e "$L_GREEN - influxdb is build !$NC"



#apply .yaml file

#metallb deployement
sleep 3
echo -e "$GREEN - Apply all .yaml files... $NC"
sleep 3
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.8.1/manifests/metallb.yaml > /dev/null
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml > /dev/null
kubectl apply -f srcs/config_metallb.yaml > /dev/null
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f srcs/nginx.yaml > /dev/null
echo -e "$GREEN - nginx deployed ! $NC"

kubectl apply -f srcs/ftps.yaml > /dev/null
echo -e "$GREEN - ftps deployed !$NC"

kubectl apply -f srcs/mysql.yaml > /dev/null
echo -e "$GREEN - mysql deployed !$NC"

kubectl apply -f srcs/wordpress.yaml > /dev/null
echo -e "$GREEN - wordpress deployed !$NC"

kubectl apply -f srcs/phpmyadmin.yaml > /dev/null
echo -e "$GREEN - phpmyadmin deployed !$NC"

kubectl apply -f srcs/grafana.yaml > /dev/null
echo -e "$GREEN - grafana deployed !$NC"

kubectl apply -f srcs/influxdb.yaml > /dev/null
echo -e "$GREEN - InfluxDB deployed !$NC"

echo -e "\n$RED - Dashboard ip : $MY_IP $NC"


minikube dashboard