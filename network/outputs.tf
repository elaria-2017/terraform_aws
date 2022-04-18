output pub_sub1_id {
    value = aws_subnet.dev-public-1.id
}
output pub_sub2_id {
    value = aws_subnet.dev-public-2.id
}
output pri_sub1_id {
    value = aws_subnet.dev-private-1.id
}
output pri_sub2_id {
    value = aws_subnet.dev-private-2.id
}
output vpc_id {
    value = aws_vpc.dev.id
}
output vpc_cidr {
    value = aws_vpc.dev.cidr_block
}
