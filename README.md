# cms_pocs

A Flutter project to try cms services.


## Butter cms

This project is at the moment ready to use butter cms https://buttercms.com/

butter cms api token should be added to authToken constant in lib/shared/utils/constants.dart file

## json response example :


{
    "meta": {
        "count": 1,
        "next_page": null,
        "previous_page": null
    },
    "data": {
        "toolscollectionitem": [
            {
                "meta": {
                    "id": 551316
                },
                "label": "USA tool",
                "banner": "https://cdn.buttercms.com/7O4qPqjKRdmDKBg8FKfY",
                "country": "USA",
                "url": "https://www.usa.gov/",
                "description": "The United States of America, often simply referred to as the USA, is a vast and diverse country located in North America. It is known for its incredible geographical diversity, spanning from the sunny beaches of Florida to the snowy peaks of Alaska. The USA is a melting pot of cultures, with people from all over the world making it their home."
            }
        ]
    }
}
