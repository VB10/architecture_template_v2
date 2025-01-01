# Generation

Please don't forget to add .dev.env with .prod.ev


```.dev.emv
BASE_URL=http://DEV_URL
API_KEY=DEV_API_KEY
```

```.prod.env
BASE_URL=http://PROD_URL
API_KEY=PROD_API_KEY
```

Then run build.sh
`dart run build_runner build`