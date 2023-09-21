const appTitle = "Content Management System";
const loreIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
//this butter cms authToken should not be defined here on a finished product
const authToken = "b2d6b351e73ad7b9505e5c702e54756b4077e57f";
const butterCmsBaseUrl = "https://api.buttercms.com/v2/";
const appFontFamily = "'Roboto'";
const paddingDefault = 16.0;

const mexicoLocale = "MX";
const usaLocale = "US";
const canadaLocale = "CA";

//cms objects id, this should not be hardcoded on the app but rather provided
// from an api call or external service
const mexicoId = "551315";
const usaId = "551316";
const canadaId = "551312";

//Error messages
const String badRequestError = 'Bad Request';
const String authError = 'Unauthorized';
const String internalServerError = 'Internal Server Error';
const String unknownError = 'Unknown Error';
const String networkError = 'Internet is not available';
const String nullResponse = 'Null response';
const String tryAgainError = 'Something went wrong try again!';
