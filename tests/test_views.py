from flask import Flask
import unittest
from app import app  # import the Flask app from your application module

class TestViews(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True

    def test_index(self):
        result = self.app.get('/')
        self.assertEqual(result.status_code, 200)

    def test_index_post(self):
        response = self.app.post('/', data={'city': 'London'})
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'London', response.data)