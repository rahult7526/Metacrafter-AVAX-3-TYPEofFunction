# ERC20 Token creation and deployment through Remix IDE

Metacrafters ETH+AVAX - 3 course assessment.

In this project, we had to create a custom token using a smart contract, deploy it on the hardhat localhost network, and use Remix IDE to interact with it.

The custom token will have following functionalities:
- The owner of the token will be able to mint tokens to other accounts
- Any user can transfer tokens to other accounts.
- Any user can burn tokens.
- Any user can check the total turnover.



### Follow the steps to configure the project

#### 1. Create a hardhat Javascript project

Run the following commands to setup the project

```
npm init -y
npm install --save-dev hardhat
npm install @nomicfoundation/hardhat-toolbox
npx hardhat
```

Choose the (Javascript) option.

#### 2. Create a local Hardhat network

```
npx hardhat node
```

Note the URL and port at which the server is running

#### 3. Deploy the smart contract with remix ide

```
remixd -s./ --remix-ide https://remix.ethereum.org
```

Note the address of the smart contract


#### 4. Remix IDE

In the Remix IDE
- Go to the deploy tab.
- Select the environment as `localhost`.
- Enter the address of the smart contract in the `At Address` tab.
- connect it with the metamask for interaction with the contract.

Now you'll be able to interact with the custom token deployed on Hardhat localhost network. 

## Author
Rahul Tiwary - rahult7526@gmail.com

## License
This project is licensed under the MIT License
