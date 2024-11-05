/*
Steps
go to remix ide
click on create file Student.sol
paste the below code from line 41
Click on solidity compiler ,compile the code
click on deploy and run transaction
enter student as   bc,23   this is the name and age
get details
getStudent by passing index 0,1,2 so on
Adios
*/
/*
Write a program in solidity to create Student data. Use the following constructs:
 Structures
 Arrays
 Fallback
Deploy this as smart contract on Ethereum and Observe the transaction fee and Gas values.

Theory
A fallback function is a special type of function in Solidity that is automatically called under certain conditions, particularly when a contract receives Ether or when a function that does not exist in the contract is called. It has the following characteristics:

    It has no name.
    It does not take any arguments and does not return anything.
    It's marked as either payable or non-payable, depending on whether it can accept Ether.
    There are two types of fallback functions in Solidity:
    
    fallback(): Invoked when a contract receives Ether and no other function matches the call data.
    receive(): A simplified fallback function that is only used to receive Ether when no data is sent.
    
    When is Fallback Triggered?
    When Ether is sent to the contract without any data.
    When a non-existent function is called.

Conclusion
Fallback: Used when a contract receives Ether or invalid function calls.
Transaction Fees and Gas: You can observe varying gas usage for deploying, adding students, and invoking the fallback.
*/


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract StudentData {
    struct Student {
        string name;
        int age;
    }

    
    Student[] public studentArray;

    // Add new student details to the array
    function addStudent(string memory name, int age) public {
        for (uint i = 0; i < studentArray.length; i++) {
            if (studentArray[i].age == age) {
                revert("Roll No Exists");
            }
        }
        studentArray.push(Student(name, age));
    }

    // Returns all students in the array
    function displayAllStudents() public view returns (Student[] memory) {
        return studentArray;
    }

    // Returns the length of the student array
    function getStudentLength() public view returns (uint256) {
        return studentArray.length;
    }

    // Get a student by index
    function getStudent(uint128 index) public view returns (Student memory) {
        require(studentArray.length > index, "Out of Index");
        return studentArray[index];
    }

    // Fallback function for handling unknown function calls
    fallback() external payable {
        // Optionally, handle the call or log it
    }

    // Receive function for handling direct ETH transfers
    receive() external payable {
        // Handle ETH transfers to the contract
    }
}