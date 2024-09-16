const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");



module.exports = buildModule("deploy", (m) => {

  const ContractA = m.contract("contractA", [], );
  m.call(ContractA, "valGetter", []);
  return { ContractA };
});






// async function main() {
// const Diamond = await ethers.getContractFactory("Diamond");
// const diamond = await Diamond.deploy();
// await diamond.deployed();
// console.log("Diamond deployed to:", diamond.address);

// const ContractAFacet = await ethers.getContractFactory("ContractAFacet");
// const contractAFacet = await ContractAFacet.deploy();
// await contractAFacet.deployed();
// console.log("ContractAFacet deployed to:", contractAFacet.address);

// const setValueSelector = ethers.utils.id("valSetter(uint256 val)").slice(0, 10);
// const getValueSelector = ethers.utils.id("valGetter()").slice(0, 10);
// const selectors = [setValueSelector, getValueSelector];

// await diamond.addFacet(getterSetterFacet.address, selectors);
//     console.log("Facet added to the diamond");
// }

// main();