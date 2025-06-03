<?php

namespace Modules\Subscriptions\database\seeders;

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;
use Modules\Subscriptions\Models\SubscriptionTransactions;

class SubscriptionsTransactionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \DB::statement('SET FOREIGN_KEY_CHECKS=0;');

        if (env('IS_DUMMY_DATA')) {
            $data = [
               
                [
                    'subscriptions_id' => 1,
                    'user_id' => 3,
                    'amount' => 0,
                    'payment_type' => 'stripe',
                    'payment_status' => 'paid',
                    'transaction_id' => 'pi_1OnGh1FTMa5P8ht0pEWTzG1e',
                    'other_transactions_details' => NULL,
                    'created_by' => 3,
                    'updated_by' => 3,
                    'deleted_by' => NULL,
                    'deleted_at' => NULL,
                    'created_at' => '2024-02-24 08:35:14',
                    'updated_at' => '2024-02-24 08:35:14',
                ],
                [
                    'subscriptions_id' => 2,
                    'user_id' => 4,
                    'amount' => 0,
                    'payment_type' => 'stripe',
                    'payment_status' => 'paid',
                    'transaction_id' => 'pi_1OnGpRFTMa5P8ht0g6ohV6ua',
                    'other_transactions_details' => NULL,
                    'created_by' => 4,
                    'updated_by' => 4,
                    'deleted_by' => NULL,
                    'deleted_at' => NULL,
                    'created_at' => '2024-02-24 08:44:03',
                    'updated_at' => '2024-02-24 08:44:03',
                ],
                [
                    'subscriptions_id' => 3,
                    'user_id' => 5,
                    'amount' => 0,
                    'payment_type' => 'stripe',
                    'payment_status' => 'paid',
                    'transaction_id' => 'pi_1OnH4yFTMa5P8ht05TMPnJmI',
                    'other_transactions_details' => NULL,
                    'created_by' => 5,
                    'updated_by' => 5,
                    'deleted_by' => NULL,
                    'deleted_at' => NULL,
                    'created_at' => '2024-02-24 08:59:59',
                    'updated_at' => '2024-02-24 08:59:59',
                ],
                [
                    'subscriptions_id' => 4,
                    'user_id' => 6,
                    'amount' => 0,
                    'payment_type' => 'stripe',
                    'payment_status' => 'paid',
                    'transaction_id' => 'pi_1OnH7aFTMa5P8ht0MZopyOgk',
                    'other_transactions_details' => NULL,
                    'created_by' => 6,
                    'updated_by' => 6,
                    'deleted_by' => NULL,
                    'deleted_at' => NULL,
                    'created_at' => '2024-02-24 09:02:40',
                    'updated_at' => '2024-02-24 09:02:40',
                ],
                [
                    'subscriptions_id' => 5,
                    'user_id' => 12,
                    'amount' => 0,
                    'payment_type' => 'stripe',
                    'payment_status' => 'paid',
                    'transaction_id' => 'pi_1OnH9DFTMa5P8ht0qlv5eOGL',
                    'other_transactions_details' => NULL,
                    'created_by' => 12,
                    'updated_by' => 12,
                    'deleted_by' => NULL,
                    'deleted_at' => NULL,
                    'created_at' => '2024-02-24 09:04:21',
                    'updated_at' => '2024-02-24 09:04:21',
                ],
                [
                    'subscriptions_id' => 6,
                    'user_id' => 9,
                    'amount' => 0,
                    'payment_type' => 'stripe',
                    'payment_status' => 'paid',
                    'transaction_id' => 'pi_1OnHBYFTMa5P8ht0UJGfnyw6',
                    'other_transactions_details' => NULL,
                    'created_by' => 9,
                    'updated_by' => 9,
                    'deleted_by' => NULL,
                    'deleted_at' => NULL,
                    'created_at' => '2024-02-24 09:06:47',
                    'updated_at' => '2024-02-24 09:06:47',
                ],
                [
                    'subscriptions_id' => 7,
                    'user_id' => 7,
                    'amount' => 0,
                    'payment_type' => 'stripe',
                    'payment_status' => 'paid',
                    'transaction_id' => 'pi_1OnHDkFTMa5P8ht0ZCk4sP0K',
                    'other_transactions_details' => NULL,
                    'created_by' => 7,
                    'updated_by' => 7,
                    'deleted_by' => NULL,
                    'deleted_at' => NULL,
                    'created_at' => '2024-02-24 09:09:03',
                    'updated_at' => '2024-02-24 09:09:03',
                ],
                [
                    'subscriptions_id' => 8,
                    'user_id' => 11,
                    'amount' => 0,
                    'payment_type' => 'stripe',
                    'payment_status' => 'paid',
                    'transaction_id' => 'pi_1OnHFkFTMa5P8ht0Z6WoJkPi',
                    'other_transactions_details' => NULL,
                    'created_by' => 11,
                    'updated_by' => 11,
                    'deleted_by' => NULL,
                    'deleted_at' => NULL,
                    'created_at' => '2024-02-24 09:11:07',
                    'updated_at' => '2024-02-24 09:11:07',
                ],
               
            ];
            foreach ($data as $key => $value) {
                $subscriptiontransaction = [
                    'subscriptions_id' => $value['subscriptions_id'],
                    'user_id' => $value['user_id'],
                    'amount' => $value['amount'],
                    'payment_type' => $value['payment_type'],
                    'payment_status' => $value['payment_status'],
                    'transaction_id' => $value['transaction_id'],
                    'other_transactions_details' => $value['other_transactions_details'],
                ];
                $subscriptiontransaction = SubscriptionTransactions::create($subscriptiontransaction);
                
            }
        }
         // Enable foreign key checks!
         \DB::statement('SET FOREIGN_KEY_CHECKS=1;');
    }
}
