import hardhat from "hardhat";

async function main() {
  console.log("deploy start");

  const NabePot = await hardhat.ethers.getContractFactory("DubuPot");
  const nabePot = await NabePot.deploy();
  console.log(`DubuPot address: ${nabePot.address}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
