// contracts/shared/facets/OwnershipFacet.sol
// SPDX-License-Identifier: BSL 1.1
pragma solidity ^0.8.0;

import { LibDiamond } from "../libraries/LibDiamond.sol";
import { IERC173 } from "../interfaces/IERC173.sol";

contract OwnershipFacet is IERC173 {
	function transferOwnership(address _newOwner) external override {
		LibDiamond.enforceIsContractOwner();
		LibDiamond.setContractOwner(_newOwner);
	}

	function owner() external view override returns (address owner_) {
		owner_ = LibDiamond.contractOwner();
	}
}
