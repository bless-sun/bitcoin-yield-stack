;; Title: Bitcoin Yield Staking Contract

;; Description:
;; This smart contract implements a Bitcoin yield staking mechanism on the Stacks blockchain.
;; Users can stake their BTC to earn yield over time, with the yield rate adjustable by the contract owner.
;; The contract includes functionalities for staking, unstaking, yield distribution, and reward claiming.
;; It also supports insurance coverage for staked amounts and adheres to the SIP-010 token standard.


(define-constant contract-owner tx-sender)

;; Error constants
(define-constant ERR-OWNER-ONLY (err u100))
(define-constant ERR-ALREADY-INITIALIZED (err u101))
(define-constant ERR-NOT-INITIALIZED (err u102))
(define-constant ERR-POOL-ACTIVE (err u103))
(define-constant ERR-POOL-INACTIVE (err u104))
(define-constant ERR-INVALID-AMOUNT (err u105))
(define-constant ERR-INSUFFICIENT-BALANCE (err u106))
(define-constant ERR-NO-YIELD-AVAILABLE (err u107))
(define-constant ERR-MINIMUM-STAKE (err u108))
(define-constant ERR-UNAUTHORIZED (err u109))
(define-constant ERR-INVALID-URI (err u110))

;; Constants
(define-constant MINIMUM-STAKE-AMOUNT u1000000) ;; 0.01 BTC in sats
(define-constant BLOCKS-PER-DAY u144)
(define-constant MAX-YIELD-RATE u5000) ;; 50% maximum APY
(define-constant MAX-TOKEN-URI-LENGTH u200) ;; Maximum length for token URI