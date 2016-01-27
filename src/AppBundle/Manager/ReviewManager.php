<?php


namespace AppBundle\Manager;

use AppBundle\Entity\Movie;

class ReviewManager
{
    const API_KEY = "";

    public function updateReviewList(Movie $movie)
    {
        <?php
            $apikey = self::API_KEY;
            $q = urlencode($movie->getName());
            $endpoint = 'http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=' . $apikey . '&q=' . $q;

            $session = curl_init($endpoint);
            curl_setopt($session, CURLOPT_RETURNTRANSFER, true);
            $data = curl_exec($session);
            curl_close($session);

            $search_results = json_decode($data);
            if ($search_results === NULL) {
                throw new \Exception('Error parsing json');
            }

    }
}
