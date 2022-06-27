const travellerDetails = artifacts.require("travellerDetails");

module.exports = function (deployer) {
  deployer.deploy(travellerDetails);
};