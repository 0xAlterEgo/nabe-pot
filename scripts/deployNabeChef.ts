import hardhat from "hardhat";

async function main() {
  console.log("deploy start");

  const NabeChef = await hardhat.ethers.getContractFactory("NabeChef");
  const nabeChef = await NabeChef.deploy();
  console.log(`NabeChef address: ${nabeChef.address}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
