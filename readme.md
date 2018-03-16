# multiple-sequence-alignment-api

Simple API for conducting multiple sequence alignments on nucleotide sequences.
This app is stateless and neither sequence data nor alignments are stored
permanently.

Supports global (MUSCLE) and local (Clustalw2) alignment.

## Installation

```sh
docker build --tag msa-api .

docker run \
  --publish 4567:4567 \
  msa-api
```

## Usage

The API accepts POST requests to `/`. For example:

```sh
curl \
  -X POST \
  -d '{"sequences":[{"id":1,"body":"CCCCTTTTGGGGAAAA"},{"id":2,"body":"CCCCGGGGAAAA"}]}' \
  -H "Content-Type: application/json" \
  http://localhost:4567
```

This will return the following JSON:


```javascript
{
  "sequences": [
    {
      "id": "1",
      "body": "CCCCTTTTGGGGAAAA"
    },
    {
      "id": "2",
      "body": "CCCC----GGGGAAAA"
    }
  ],
  "log": "\nMUSCLE v3.8.1551 by Robert C. Edgar\n\nhttp://www.drive5.com/muscle\nThis software is donated to the public domain.\nPlease cite: Edgar, R.C. Nucleic Acids Res 32(5), 1792-97.\n\nfasta20170203-77773-1usv5rp 2 seqs, lengths min 12, max 16, avg 14\n00:00:00      2 MB(0%)  Iter   1   33.33%  K-mer dist pass 1\r00:00:00      2 MB(0%)  Iter   1  100.00%  K-mer dist pass 1\r\n00:00:00      2 MB(0%)  Iter   1   33.33%  K-mer dist pass 2\r00:00:00      2 MB(0%)  Iter   1  100.00%  K-mer dist pass 2\r\n00:00:00      2 MB(0%)  Iter   1  100.00%  Align node       \r00:00:00      2 MB(0%)  Iter   1  100.00%  Align node\r\n00:00:00      2 MB(0%)  Iter   1   50.00%  Root alignment\r00:00:00      2 MB(0%)  Iter   1  100.00%  Root alignment\r00:00:00      2 MB(0%)  Iter   1  100.00%  Root alignment\r\n"
}
```
