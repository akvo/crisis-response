export const exampleLogic = (store) => (next) => (action) => {
    console.info(action.type);
    next(action);
};
