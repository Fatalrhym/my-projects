echo -e $(cat certificate.pem)
sed -r "s/\n/\n/g" certificate.pem