build:
	rm -rf public
	hugo

deploy: build
	aws s3 sync public/ s3://abinthomas.me --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E26GAWLK6DVR48 --paths '/*'